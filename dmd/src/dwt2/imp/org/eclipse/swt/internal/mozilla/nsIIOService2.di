module org.eclipse.swt.internal.mozilla.nsIIOService2;

import org.eclipse.swt.internal.mozilla.Common;
import org.eclipse.swt.internal.mozilla.nsID;
import org.eclipse.swt.internal.mozilla.nsIIOService;

const char[] NS_IIOSERVICE2_IID_STR = "d44fe6d4-ee35-4789-886a-eb8f0554d04e";

const nsIID NS_IIOSERVICE2_IID= 
  {0xd44fe6d4, 0xee35, 0x4789, 
    [ 0x88, 0x6a, 0xeb, 0x8f, 0x05, 0x54, 0xd0, 0x4e ]};

interface nsIIOService2 : nsIIOService {

  static const char[] IID_STR = NS_IIOSERVICE2_IID_STR;
  static const nsIID IID = NS_IIOSERVICE2_IID;

extern(System):
  nsresult GetManageOfflineStatus(PRBool *aManageOfflineStatus);
  nsresult SetManageOfflineStatus(PRBool aManageOfflineStatus);

}


version (build) {
    debug {
        pragma(link, "dwt2win32");
    } else {
        pragma(link, "dwt2win32");
    }
}
