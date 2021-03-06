module org.eclipse.swt.internal.mozilla.nsIHistoryEntry;

import org.eclipse.swt.internal.mozilla.Common;
import org.eclipse.swt.internal.mozilla.nsID;
import org.eclipse.swt.internal.mozilla.nsISupports;

import org.eclipse.swt.internal.mozilla.nsIURI;

const char[] NS_IHISTORYENTRY_IID_STR = "a41661d4-1417-11d5-9882-00c04fa02f40";

const nsIID NS_IHISTORYENTRY_IID= 
  {0xa41661d4, 0x1417, 0x11d5, 
    [ 0x98, 0x82, 0x00, 0xc0, 0x4f, 0xa0, 0x2f, 0x40 ]};

interface nsIHistoryEntry : nsISupports {

  static const char[] IID_STR = NS_IHISTORYENTRY_IID_STR;
  static const nsIID IID = NS_IHISTORYENTRY_IID;

extern(System):
  nsresult GetURI(nsIURI  *aURI);
  nsresult GetTitle(PRUnichar * *aTitle);
  nsresult GetIsSubFrame(PRBool *aIsSubFrame);

}


version (build) {
    debug {
        pragma(link, "dwt2win32");
    } else {
        pragma(link, "dwt2win32");
    }
}
