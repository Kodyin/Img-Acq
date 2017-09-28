package com.springmvc.cache;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class LocalCache {
    public static Map<String,String> cachemap = new ConcurrentHashMap<String,String>();
}
