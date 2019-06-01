# scrapy


<!-- vim-markdown-toc GFM -->

* [youtube](#youtube)
* [twitter](#twitter)

<!-- vim-markdown-toc -->

## youtube
```python
ds = soup.find('div', id='content')
divs = ds.find_all('div', class_="yt-lockup-content")


In [120]: div.find('ul', class_='yt-lockup-meta-info').find_all('li')[0].get_text()
Out[120]: '1 day ago'

In [121]: div.find('ul', class_='yt-lockup-meta-info').find_all('li')[1].get_text()
Out[121]: '3,784,552 views'


In [130]: div.find('a', class_='yt-uix-tile-link yt-ui-ellipsis yt-ui-ellipsis-2 yt-uix-sessionlink spf-link ')
Out[130]: <a aria-describedby="description-id-403189" class="yt-uix-tile-link yt-ui-ellipsis yt-ui-ellipsis-2 yt-uix-sessionlink spf-link " data-sessionlink="itct=CGcQ3DAYACITCLugwI_ey94CFcIrKgodxlcElijpHjIIdHJlbmRpbmdaCkZFdHJlbmRpbmc" dir="ltr" href="/watch?v=oicXRb50H_I" title="CATCHING EXERCISE BALLS from 165m Dam!">CATCHING EXERCISE BALLS from 165m Dam!</a>


In [154]: for _i, div in enumerate(divs):
     ...:     print(_i)
     ...:     info = dict()
     ...:     link = div.find('a', class_='yt-uix-tile-link yt-ui-ellipsis yt-ui-ellipsis-2 yt-uix-sessionlink spf-link ')
     ...:     info['url'] = link['href']
     ...:     info['title'] = link['title']
     ...:     meta = div.find('ul', class_='yt-lockup-meta-info').find_all('li')
     ...:     info['date'] = meta[0].get_text()
     ...:     if len(meta) > 1:
     ...:         info['views'] = meta[1].get_text()
     ...:     summ.append(info)
```
[top](#scrapy)
## twitter
```python
lis = soup.find_all('li', class_=re.compile('js-stream-item stream-item stream-item'))
<div class="PlayableMedia PlayableMedia--video">
这是有video的list

divs2 = soup.find_all('div', class_='stream-item-header')

href: 
for div in divs2:
    ...:     url = div.find('a', class_='tweet-timestamp js-permalink js-nav js-tooltip')
    ...:     if url:
    ...:         url = urljoin('https://www.twitter.com/',url['href']   )
    ...:         urls.append(url)

<a class="tweet-timestamp js-permalink js-nav js-tooltip" data-conversation-id="1050034816052326400" href="/richbrian/status/1050034816052326400" title="7:46 AM - 10 Oct 2018"><span class="_timestamp js-short-timestamp " data-aria-label-part="last" data-long-form="true" data-time="1539182783" data-time-ms="1539182783000">Oct 10</span></a>
里面有时间戳，转换为发布时间

span = li.find('span', class_=re.compile('ProfileTweet-action--reply'))

       <span class="ProfileTweet-action--reply u-hiddenVisually"> <span class="ProfileTweet-actionCount" data-tweet-stat-count="247"> <span class="ProfileTweet-actionCountForAria" data-aria-label-part="" id="profile-tweet-action-reply-count-aria-1050034816052326400">247 replies</span> </span> </span> 
       <span class="ProfileTweet-action--retweet u-hiddenVisually"> <span class="ProfileTweet-actionCount" data-tweet-stat-count="3811"> <span class="ProfileTweet-actionCountForAria" data-aria-label-part="" id="profile-tweet-action-retweet-count-aria-1050034816052326400">3,811 retweets</span> </span> </span> 
       <span class="ProfileTweet-action--favorite u-hiddenVisually"> <span class="ProfileTweet-actionCount" data-tweet-stat-count="13794"> <span class="ProfileTweet-actionCountForAria" data-aria-label-part="" id="profile-tweet-action-favorite-count-aria-1050034816052326400">13,794 likes</span> </span> </span> 
```
[top](#scrapy)
