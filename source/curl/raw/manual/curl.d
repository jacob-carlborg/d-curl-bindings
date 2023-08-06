module curl.raw.manual.curl;

public import curl.raw.manual.easy;

import curl.raw.curl;
import curl.raw.easy;
import curl.raw.multi;

auto curl_easy_getinfo(Arg)(CURL* handle, CURLINFO info, Arg arg)
{
    return curl.raw.easy.curl_easy_getinfo(handle, info, arg);
}

auto curl_share_setopt(Param)(CURLSH share, CURLSHoption opt, param)
{
    return _curl_share_setopt(share, opt, param);
}

auto curl_multi_setopt(Param)(CURLM* handle, CURLMoption opt, Param param)
{
    return curl.raw.multi.curl_multi_setopt(handle, opt, param);
}

private:
extern (C):

pragma(mangle, "curl_share_setopt")
CURLSHcode _curl_share_setopt(CURLSH* share,CURLSHoption option, ...);
