module java.util.Comparator;

interface Comparator
{
	//bool equals (Object obj);
	int compare (Object o1, Object o2);
}

version (build) {
    debug {
        pragma(link, "dwt2base");
    } else {
        pragma(link, "dwt2base");
    }
}
