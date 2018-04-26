#!/usr/bin/python
# -*- coding: UTF-8 -*-

import chardet

def _smartcode(stream):
    """ smart recove stream into UTF-8
    """
    if(stream.strip() == ""):return ""
    codedetect = chardet.detect(stream)["encoding"]
    try:
        return "%s %s" %("",unicode(stream,codedetect).encode('utf8'))
    except:
        return "bad unicode encode try !"
