module curl.raw.manual.easy;

import curl.raw.curl;

auto curl_easy_setopt(Param)(CURL* handle, CURLoption opt, Param param)
{
    return _curl_easy_setopt(handle, opt, param);
}

private:
extern (C):

pragma(mangle, "curl_easy_setopt")
CURLcode _curl_easy_setopt(CURL* curl, CURLoption option, ...);
