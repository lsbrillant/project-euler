#include <cmath>
#include <cstdio>

auto 
getnumdigits(auto subject) 
{
    return floor(log10(subject)) + 1L; 
}

auto 
getplacedigit(auto subject, auto place)
{
    const auto scale = (long)pow(10L,place);
    return (subject % (10L*scale)) / scale;
}

auto 
sumofdigits(auto subject)
{
    auto count = 0L;
    for(auto num_dig=getnumdigits(subject);num_dig<=0L;num_dig--) 
    {
        count += getplacedigit(subject, num_dig);
    }
    return count;
}

auto
next(auto last) 
{
    return last + sumofdigits(last);
}


int 
main(int nargs, char**argv) 
{
    const auto target = 20L;//(long)pow(10L,6L);
    auto ans = 1L;
    for(auto i=0L;i<target;i++) {
        ans = next(ans); 
    }
    printf("The sum of digits sequence for %d is %d\n", target, ans);
}
