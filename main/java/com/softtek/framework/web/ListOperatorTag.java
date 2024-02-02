package com.softtek.framework.web;

import java.util.List;

import org.apache.log4j.Logger;

public class ListOperatorTag {
	private static final Logger log = Logger.getLogger(ListOperatorTag.class);

	public static boolean contiene(List<Object> list, Object item) {
		if (list!=null)
			return list.contains(item);
		else
			return false;
	}

	public static boolean contieneInt(List<Integer> list, Integer item) {
		if (list!=null)
			return list.contains(item);
		else
			return false;
	}

	public static boolean contieneLong(List<Long> list, Long item) {
		if (list!=null)
			return list.contains(item);
		else
			return false;
	}
	
}
