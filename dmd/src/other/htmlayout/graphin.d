module htmlayout.graphin;

import htmlayout.capi;
import tango.sys.win32.Types;
import tango.stdc.stringz;
import tango.text.convert.Utf;
import tango.io.model.IConduit;
import tango.io.device.File;
import htmlayout.htmlayout; //bug, not import this
class HImage
{
	protected this(HIMG h,UINT sizex,UINT sizey)
	{
		mHandle=h;
		mWidth=sizex;
		mHeight=sizey;
	}

	~this() 
	{
		if(mHandle) mGraphin.imageRelease(mHandle);
	}

	static HImage opCall(UINT sizex,UINT sizey)
	{
		if(mGraphin is null) mGraphin=gApi();
		HIMG himg;
		if(mGraphin.imageCreate(sizex,sizey,&himg)==GRAPHIN_OK && himg) return new HImage(himg,sizex,sizey);
		else return null;
	}

	static HImage opCall(char[] data) // loads image from png or jpeg enoded data
	{
		if(mGraphin is null) mGraphin=gApi();
		HIMG himg;
		if(mGraphin.imageLoad(cast(ubyte*)data.ptr,data.length,&himg)==GRAPHIN_OK && himg)
		{
			BYTE* ddata;UINT width;UINT height;INT stride;UINT pixel_format;
			mGraphin.imageGetInfo(himg,&ddata,&width,&height,&stride,&pixel_format);
			return new HImage(himg,width,height);
		}
		else return null;
	}

	bool save(OutputStream strm,uint quality = 0 /*JPEG qquality: 20..100,if 0 - PNG */) // save image as png or jpeg enoded data
	{
		static uint lastsaver=0;
		auto id=++lastsaver;
		mSavers[id]=strm;
		scope(exit) mSavers.remove(id);
		if(quality >= 1 && quality <= 100) // jpeg
			return (lastResult = mGraphin.imageSave(mHandle,&mWriteImage,cast(void*)id,24,1,quality))==GRAPHIN_OK;
		else // png
			return (lastResult = mGraphin.imageSave(mHandle,&mWriteImage,cast(void*)id,32,0,0))==GRAPHIN_OK;
	}

	bool save(char[] file,uint quality=0)
	{
		File f;
		try
			f=new File(file,File.WriteCreate);
		catch(Object o)
			return false;
		scope(exit) f.close;
		return save(f,quality);
	}

	uint width() {return mWidth;}
	uint height() {return mHeight;}
	HIMG handle() {return mHandle;}

	bool clear(){return (lastResult=mGraphin.imageClear(mHandle))==GRAPHIN_OK;}

	// bitblit it to the hdc
	bool blit(HPLATFORMGFX hdc,INT dx,INT dy,INT sx=0,INT sy=0,INT w=-1,INT h=-1,bool blend=true){return (lastResult=mGraphin.imageBlit(hdc,dx,dy,mHandle,sx,sy,w<0?mWidth:w,h<0?mHeight:h,blend?1:0))==GRAPHIN_OK;}

	bool renderElement(htmlayout.element.HElement e,int x,int y,bool now=true){return (lastResult=HTMLayoutRenderElement(mHandle,POINT(x,y),e.handle,now?1:0))==GRAPHIN_OK;}

	GRAPHIN_RESULT lastResult;
	char[] lastResultMsg() {return graphinResultMsg(lastResult);}

protected:
	HIMG mHandle;
	UINT mWidth;
	UINT mHeight;
	static Graphin *mGraphin;

	static tango.io.model.IConduit.OutputStream[uint] mSavers;

	extern(Windows) static BOOL mWriteImage(LPVOID prm, LPBYTE data, UINT data_length)
	{
		auto saver=cast(uint)prm in mSavers;
		if(saver && *saver) return saver.write(data[0..data_length])==data_length;
		else return false;
	}
}

class HGraphics
{
	HGFX handle() {return mHandle;}

	this(HImage img)
	{
		if(!img || !img.handle) throw new Exception("Bad image handle!");
		if(mGraphin is null) mGraphin=gApi();
		mGraphin.gCreate(img.handle,&mHandle);
	}
	~this() {if(mHandle) mGraphin.gRelease(mHandle);}

	static HGraphics opCall(HImage img)
	{
		if(img && img.handle) return new HGraphics(img);
		else return null;
	}

	// Draws line from x1,y1 to x2,y2 using current line_color and line_gradient.
	bool line(POS x1,POS y1,POS x2,POS y2){return (lastResult=mGraphin.gLine(mHandle,x1,y1,x2,y2))==GRAPHIN_OK;}

	// Draws triangle using current lineColor/lineGradient and fillColor/fillGradient.
	bool triangle(POS x1,POS y1,POS x2,POS y2,POS x3,POS y3){return (lastResult=mGraphin.gTriangle(mHandle,x1,y1,x2,y2,x3,y3))==GRAPHIN_OK;}

	// Draws rectangle using current lineColor/lineGradient and fillColor/fillGradient 
	bool rectangle(POS x1,POS y1,POS x2,POS y2){return (lastResult=mGraphin.gRectangle(mHandle,x1,y1,x2,y2))==GRAPHIN_OK;}

	// Draws rounded rectangle using current lineColor/lineGradient and fillColor/fillGradient with rounded corners.
	bool rectangle(POS x1,POS y1,POS x2,POS y2,DIM rAll)
	{
		scope DIM[8] rad = [rAll,rAll,rAll,rAll,rAll,rAll,rAll,rAll];
		return (lastResult=mGraphin.gRoundedRectangle(mHandle,x1,y1,x2,y2,rad.ptr))==GRAPHIN_OK;
	}

	bool rectangle(POS x1,POS y1,POS x2,POS y2,DIM rTopLeft,DIM rTopRight,DIM rBottomRight,DIM rBottomLeft)
	{
		scope DIM[8] rad = [rTopLeft,rTopLeft,rTopRight,rTopRight,rBottomRight,rBottomRight,rBottomLeft,rBottomLeft];
		return (lastResult=mGraphin.gRoundedRectangle(mHandle,x1,y1,x2,y2,rad.ptr))==GRAPHIN_OK;
	}


	// Draws circle or ellipse using current lineColor/lineGradient and fillColor/fillGradient.
	bool ellipse(POS x,POS y,POS rx,POS ry){return (lastResult=mGraphin.gEllipse(mHandle,x,y,rx,ry))==GRAPHIN_OK;}
	bool circle(POS x,POS y,POS radii){return (lastResult=mGraphin.gEllipse(mHandle,x,y,radii,radii))==GRAPHIN_OK;}

	// Draws closed arc using current lineColor/lineGradient and fillColor/fillGradient.
	bool arc(POS x,POS y,POS rx,POS ry,ANGLE start,ANGLE sweep){return (lastResult=mGraphin.gArc(mHandle,x,y,rx,ry,start,sweep))==GRAPHIN_OK;}

	// Draws star.
	bool star(POS x,POS y,POS r1,POS r2,ANGLE start,UINT rays){return (lastResult=mGraphin.gStar(mHandle,x,y,r1,r2,start,rays))==GRAPHIN_OK;}

	// Draws closed polygon using current lineColor/lineGradient and fillColor/fillGradient.
	bool polygon(POS* xy,UINT num_points){return (lastResult=mGraphin.gPolygon(mHandle,xy,num_points))==GRAPHIN_OK;}

	// you bet
	bool polyline(POS* xy,uint num_points){return (lastResult=mGraphin.gPolyline(mHandle,xy,num_points))==GRAPHIN_OK;}

	// SECTION: Path operations

	bool openPath(){return (lastResult=mGraphin.gOpenPath(mHandle))==GRAPHIN_OK;}

	bool moveTo(POS x,POS y,bool relative){return (lastResult=mGraphin.gMoveTo(mHandle,x,y,relative))==GRAPHIN_OK;}

	bool lineTo(POS x,POS y,bool relative){return (lastResult=mGraphin.gLineTo(mHandle,x,y,relative))==GRAPHIN_OK;}

	bool hlineTo(POS x,bool relative){return (lastResult=mGraphin.gHLineTo(mHandle,x,relative))==GRAPHIN_OK;}

	bool vlineTo(POS y,bool relative){return (lastResult=mGraphin.gVLineTo(mHandle,y,relative))==GRAPHIN_OK;}

	bool arcTo(POS x,POS y,ANGLE angle,POS rx,POS ry,bool is_large_arc,bool sweep_flag,bool relative){return (lastResult=mGraphin.gArcTo(mHandle,x,y,angle,rx,ry,is_large_arc,sweep_flag,relative))==GRAPHIN_OK;}

	bool ellipseTo(POS x,POS y,POS rx,POS ry,bool clockwise){return (lastResult=mGraphin.gEllipseTo(mHandle,x,y,rx,ry,clockwise))==GRAPHIN_OK;}

	bool quadraticCurveTo(POS xc,POS yc,POS x,POS y,bool relative){return (lastResult=mGraphin.gQuadraticCurveTo(mHandle,xc,yc,x,y,relative))==GRAPHIN_OK;}

	bool bezierCurveTo(POS xc1,POS yc1,POS xc2,POS yc2,POS x,POS y,bool relative){return (lastResult=mGraphin.gBezierCurveTo(mHandle,xc1,yc1,xc2,yc2,x,y,relative))==GRAPHIN_OK;}

	bool closePath(){return (lastResult=mGraphin.gClosePath(mHandle))==GRAPHIN_OK;}

	bool drawPath(DRAW_PATH_MODE dpm){return (lastResult=mGraphin.gDrawPath(mHandle,dpm))==GRAPHIN_OK;}

	// end of path opearations

	// SECTION: affine tranformations:

	bool rotate(ANGLE radians){return (lastResult=mGraphin.gRotate(mHandle,radians,null,null))==GRAPHIN_OK;}

	bool rotate(ANGLE radians,POS center_x,POS center_y){return (lastResult=mGraphin.gRotate(mHandle,radians,&center_x,&center_y))==GRAPHIN_OK;}

	bool translate(POS cx,POS cy){return (lastResult=mGraphin.gTranslate(mHandle,cx,cy))==GRAPHIN_OK;}

	bool scale(REAL x,REAL y){return (lastResult=mGraphin.gScale(mHandle,x,y))==GRAPHIN_OK;}

	bool skew(REAL dx,REAL dy){return (lastResult=mGraphin.gSkew(mHandle,dx,dy))==GRAPHIN_OK;}

	// all above in one shot
	bool transform(POS m11,POS m12,POS m21,POS m22,POS dx,POS dy){return (lastResult=mGraphin.gTransform(mHandle,m11,m12,m21,m22,dx,dy))==GRAPHIN_OK;}

	// end of affine tranformations.

	// SECTION: state save/restore

	bool stateSave(){return (lastResult=mGraphin.gStateSave(mHandle))==GRAPHIN_OK;}

	bool stateRestore(){return (lastResult=mGraphin.gStateRestore(mHandle))==GRAPHIN_OK;}

	// end of state save/restore

	// SECTION: drawing attributes

	// set line width for subsequent drawings.
	bool lineWidth(DIM width){return (lastResult=mGraphin.gLineWidth(mHandle,width))==GRAPHIN_OK;}

	bool noLine() {return lineWidth(0.0);}

	bool lineColor(HColor c) {return (lastResult=mGraphin.gLineColor(mHandle,graphinColor(c)))==GRAPHIN_OK;}

	bool lineCap(LINE_CAP_TYPE ct){return (lastResult=mGraphin.gLineCap(mHandle,ct))==GRAPHIN_OK;}

	bool lineJoin(LINE_JOIN_TYPE jt){return (lastResult=mGraphin.gLineJoin(mHandle,jt))==GRAPHIN_OK;}

	// color for solid fills
	bool fillColor(HColor c){return (lastResult=mGraphin.gFillColor(mHandle,graphinColor(c)))==GRAPHIN_OK;}

	bool noFill(){return fillColor(*HColor(0,0,0,0xff));}

	// setup parameters of linear gradient of lines.
	bool lineLinearGradient(POS x1,POS y1,POS x2,POS y2,HColorStop[] stops){return (lastResult=mGraphin.gLineGradientLinear(mHandle,x1,y1,x2,y2,stops.ptr,stops.length))==GRAPHIN_OK;}
	bool lineLinearGradient(POS x1,POS y1,POS x2,POS y2,HColor c1,HColor c2){auto stops = [ *HColorStop(graphinColor(c1),0.0),*HColorStop(graphinColor(c2),1.0) ];return fillLinearGradient(x1,y1,x2,y2,stops);
	}

	// setup parameters of linear gradient of fills.
	bool fillLinearGradient(POS x1,POS y1,POS x2,POS y2,HColorStop[] stops){return (lastResult=mGraphin.gFillGradientLinear(mHandle,x1,y1,x2,y2,stops.ptr,stops.length))==GRAPHIN_OK;}

	bool fillLinearGradient(POS x1,POS y1,POS x2,POS y2,HColor c1,HColor c2){auto stops = [ *HColorStop(graphinColor(c1),0.0),*HColorStop(graphinColor(c2),1.0) ];return fillLinearGradient(x1,y1,x2,y2,stops);
	}

	// setup parameters of line gradient radial fills.
	bool lineRadialGradient(POS x,POS y,DIM radii,HColorStop[] stops){return (lastResult=mGraphin.gFillGradientRadial(mHandle,x,y,radii,stops.ptr,stops.length))==GRAPHIN_OK;}

	bool lineRadialGradient(POS x,POS y,DIM radii,HColor c1,HColor c2){auto stops = [ *HColorStop(graphinColor(c1),0.0),*HColorStop(graphinColor(c2),1.0) ];return lineRadialGradient(x,y,radii,stops);
	}

	// setup parameters of gradient radial fills.
	bool fillRadialGradient(POS x,POS y,DIM radii,HColorStop[] stops){return (lastResult=mGraphin.gFillGradientRadial(mHandle,x,y,radii,stops.ptr,stops.length))==GRAPHIN_OK;}

	bool fillRadialGradient(POS x,POS y,DIM radii,HColor c1,HColor c2){auto stops = [ *HColorStop(graphinColor(c1),0.0),*HColorStop(graphinColor(c2),1.0) ];return fillRadialGradient(x,y,radii,stops);
	}


	bool fillMode(bool even_odd /* false - fill_non_zero */){return (lastResult=mGraphin.gFillMode(mHandle,even_odd))==GRAPHIN_OK;}

	// SECTION: text

	// define font attributes for all subsequent text operations.
	bool font(char[] name,DIM size,bool bold = false,bool italic = false,ANGLE angle = 0){return (lastResult=mGraphin.gSetFont(mHandle,toStringz(name),size,bold,italic,angle))==GRAPHIN_OK;}

	// draw text at x,y with text alignment
	bool text(POS x,POS y,char[] t){auto str=toString16(t);return (lastResult=mGraphin.gText(mHandle,x,y,str.ptr,str.length))==GRAPHIN_OK;
	}

	// calculates width of the text string
	DIM textWidth(char[] t)
	{
		DIM width;
		auto str=toString16(t);
		if((lastResult=mGraphin.gTextWidth(mHandle,str.ptr,str.length,&width))==GRAPHIN_OK) return width;
		else return -1;
	}

	// returns height and ascent of the font.
	bool fontMetrics(ref DIM height,ref DIM ascent){return (lastResult=mGraphin.gFontMetrics(mHandle,&height,&ascent))==GRAPHIN_OK;}

	// set text alignments
	bool textAlignment(TEXT_ALIGNMENT x,TEXT_ALIGNMENT y){return (lastResult=mGraphin.gTextAlignment(mHandle,x,y))==GRAPHIN_OK;}

	// SECTION: image rendering

	// draws img onto the graphics surface with current transformation applied(scale,rotation). expensive
	bool drawImage(HImage pimg,POS x,POS y,DIM w,DIM h,UINT ix,UINT iy,UINT iw,UINT ih){return (lastResult=mGraphin.gDrawImage(mHandle,pimg.handle,x,y,&w,&h,&ix,&iy,&iw,&ih))==GRAPHIN_OK;}
	// draws whole img onto the graphics surface with current transformation applied(scale,rotation). expensive
	bool drawImage(HImage pimg,POS x,POS y){return (lastResult=mGraphin.gDrawImage(mHandle,pimg.handle,x,y,null,null,null,null,null,null))==GRAPHIN_OK;}
	// blends image bits with bits of the surface. no affine transformations. less expensive
	bool blendImage(HImage pimg,POS x,POS y,UINT opacity,UINT ix,UINT iy,UINT iw,UINT ih){return (lastResult=mGraphin.gBlendImage(mHandle,pimg.handle,x,y,opacity,&ix,&iy,&iw,&ih))==GRAPHIN_OK;}
	// blends image bits with bits of the surface. no affine transformations. less expensive
	bool blendImage(HImage pimg,POS x,POS y,UINT opacity){return (lastResult=mGraphin.gBlendImage(mHandle,pimg.handle,x,y,opacity,null,null,null,null))==GRAPHIN_OK;}
	// blits image bits onto underlying pixel buffer. no affine transformations. 
	bool blitImage(HImage pimg,POS x,POS y,UINT ix,UINT iy,UINT iw,UINT ih){return (lastResult=mGraphin.gBlitImage(mHandle,pimg.handle,x,y,&ix,&iy,&iw,&ih))==GRAPHIN_OK;}
	// blits image bits onto underlying pixel buffer. no affine transformations. 
	bool blitImage(HImage pimg,POS x,POS y){return (lastResult=mGraphin.gBlitImage(mHandle,pimg.handle,x,y,null,null,null,null))==GRAPHIN_OK;}

	// SECTION: coordinate space

	bool worldToScreen(ref POS inout_x,ref POS inout_y){return (lastResult=mGraphin.gWorldToScreen(mHandle,&inout_x,&inout_y))==GRAPHIN_OK;}

	bool worldToScreen(ref DIM inout_length){return (lastResult=mGraphin.gWorldToScreen(mHandle,&inout_length,null))==GRAPHIN_OK;}

	bool screenToWorld(ref POS inout_x,ref POS inout_y){return (lastResult=mGraphin.gScreenToWorld(mHandle,&inout_x,&inout_y))==GRAPHIN_OK;}

	bool screenToWorld(ref DIM inout_length){return (lastResult=mGraphin.gScreenToWorld(mHandle,&inout_length,null))==GRAPHIN_OK;}

	// SECTION: clipping

	bool setClipBox(POS x1,POS y1,POS x2,POS y2){return (lastResult=mGraphin.gSetClipBox(mHandle,x1,y1,x2,y2))==GRAPHIN_OK;}

	bool getClipBox(ref POS x1,ref POS y1,ref POS x2,ref POS y2){return (lastResult=mGraphin.gGetClipBox(mHandle,&x1,&y1,&x2,&y2))==GRAPHIN_OK;}

	bool visible(POS x,POS y)
	{
		BOOL is_in = 0;
		return (lastResult=mGraphin.gPointInClipBox(mHandle,x,y,&is_in))==GRAPHIN_OK;
		return is_in != 0;
	}

	bool visible(POS x1,POS y1,POS x2,POS y2)
	{
		BOOL is_in = 0;
		return (lastResult=mGraphin.gRectInClipBox(mHandle,x1,y1,x2,y2,&is_in))==GRAPHIN_OK;
		return is_in != 0;
	}

	GRAPHIN_RESULT lastResult;
	char[] lastResultMsg() {return graphinResultMsg(lastResult);}

protected:
	HGFX mHandle;
	static Graphin *mGraphin;
}

struct HColor
{
	byte r,g,b,a;

	static HColor* opCall()
	{
		auto ret=new HColor;
		ret.a=cast(byte)0xff;
		return ret;
	}

	static HColor* opCall(uint rgbt=0x000000ff)
	{
		auto ret=new HColor;
		ret.r=rgbt & 0xff;
		ret.g=(rgbt & 0xff00) >> 8;
		ret.b=(rgbt & 0xff0000) >> 16;
		ret.a=(rgbt & 0xff000000) >> 24;
		return ret;
	}

	static HColor* opCall(uint red,uint green,uint blue,uint alpha=0)
	{
		auto ret=new HColor;
		ret.r=cast(byte)red;
		ret.g=cast(byte)green;
		ret.b=cast(byte)blue;
		ret.a=cast(byte)alpha;
		return ret;
	}

	HColor* clone()
	{
		auto ret=new HColor;
		*ret=*this;
		return ret;
	}
	
	bool transparent() {return a == 0xff;}

	/*HColor* parse(char[] text,HColor *default_value = HColor())
	{
		if(text.length == 0) 
			return default_value;
		if(text[0] == '#') // #xxx,#xxxx,#xxxxxx,#xxxxxxxx
		{
			int R = 0,G = 0,B = 0,T = 0;
			switch(text.length)
			{
				case 4: swscanf(text.start+1 ,L"%1x%1x%1x",&R,&G,&B);R <<= 4;G <<= 4;B <<= 4;break;
				case 5: swscanf(text.start+1 ,L"%1x%1x%1x%1x",&R,&G,&B,&T);R <<= 4;G <<= 4;B <<= 4;T <<= 4;break;
				case 7: swscanf(text.start+1 ,L"%2x%2x%2x",&R,&G,&B);break;
				case 9: swscanf(text.start+1 ,L"%2x%2x%2x%2x",&R,&G,&B,&T);break;
				default: return default_value;
			}
			return color(R,G,B,T);
		}
		else if(text.like(L"rgb(*)")) // rgb(r,g,b),rgb(r,g,b,a)
		{
			text.start += 4;text.length -= 5;
			unsigned ca[4] = {0};aux::wchars tok;aux::wtokens toks(text,L",");
			for(int n = 0;n < 4;++n)
			{
				if(!toks.next(tok)) break;
				ca[n] = aux::to_uint(tok);
				if(tok.start[tok.length] == '%')	ca[n] =(ca[n] * 255) / 100;
			}
			return color(aux::limit(ca[0],0U,255U),aux::limit(ca[1],0U,255U),aux::limit(ca[2],0U,255U),aux::limit(ca[3],0U,255U));
		}
		return default_value;
	}*/
}

private Graphin* gApi()
{
	static Graphin *mGraphin;
	if(mGraphin is null) mGraphin=HTMLayoutGetGraphin();
	return mGraphin;
}

COLOR graphinColor(HColor c) {return gApi.RGBT(c.r,c.g,c.b,c.a);}
COLOR graphinColor(uint r,uint g,uint b,uint a = 0) {return gApi.RGBT(r,g,b,a);}

char[] graphinResultMsg(GRAPHIN_RESULT res)
{
	if(res==GRAPHIN_PANIC) return "GRAPHIN_PANIC - e.g. not enough memory";
	else if(res==GRAPHIN_OK) return "GRAPHIN_OK";
	else if(res==GRAPHIN_BAD_PARAM) return "GRAPHIN_BAD_PARAM - bad parameter";
	else if(res==GRAPHIN_FAILURE) return "GRAPHIN_FAILURE - operation failed,e.g. restore() without save()";
	else if(res==GRAPHIN_NOTSUPPORTED) return "GRAPHIN_NOTSUPPORTED - the platform does not support requested feature";
	else return null;
}