<!-- vim-markdown-toc GFM -->

* [Elasticsearch python api](#elasticsearch-python-api)
    * [index](#index)
        * [create index](#create-index)
        * [delete index](#delete-index)
        * [mapping](#mapping)
        * [update mapping](#update-mapping)
    * [doc](#doc)
        * [add doc](#add-doc)
        * [update doc](#update-doc)
        * [delete doc](#delete-doc)
    * [search](#search)
        * [Query and filter context](#query-and-filter-context)
            * [Query context](#query-context)
            * [Filter context](#filter-context)
        * [filter](#filter)
        * [bool](#bool)
            * [should](#should)
            * [must](#must)
        * [match](#match)
        * [判断某个字段是否存在](#判断某个字段是否存在)
        * [should最少匹配多少次](#should最少匹配多少次)
        * [phrase_match](#phrase_match)
    * [sort](#sort)

<!-- vim-markdown-toc -->

# Elasticsearch python api

## index

### create index
`es_client.index.create(index='star', body=star_body)`
### delete index
`es_client.index.delete(index='star')`

### mapping
```python
    star_body = {
        "mappings": {
            "star": {
                "properties": dict(
                    tags=dict(
                        type='keyword',
                        # type='nested',
                        # properties=dict(
                        #     name=dict(
                        #         type='keyword',
                        #         index='true',
                        #     ),
                        # ),
                    ),
                    desc=dict(
                        type='text',
                    ),
                ),
            },
        },
    }
```

### update mapping
`index.put_mapping(doc_type='star', body=update_mapping, index='star')`
```python
    new_mapping = {
        'properties': {
            'user_id': {
                'type': 'keyword'
            }
        }
    }
```

## doc
### add doc
`es.create(index='star', doc_type='star', id='1', body=doc1)`
```python
{'desc': u'\u674e\u56db,\u674e\u4e94',
 'tags': [u'\u674e\u56db', u'\u674e\u4e94']}
```
### update doc
`es.index(index='star', doc_type='star', id='0', body=doc1)`

### delete doc
`es.delete(index='star', doc_type='star', id='0')`

## search

* 使用query来进行打分，filter来进行过滤
* 

### Query and filter context
The behaviour of a query clause depends on whether it is used in query context or in filter context:

#### Query context
**回答相似度**  

A query clause used in query context answers the question “How well does this document match this query clause?” Besides deciding whether or not the document matches, the query clause also calculates a \_score representing how well the document matches, relative to other documents.

Query context is in effect whenever a query clause is passed to a query parameter, such as the query parameter in the search API.

#### Filter context
**就是过滤**

In filter context, a query clause answers the question “Does this document match this query clause?” The answer is a simple Yes or No — no scores are calculated. Filter context is mostly used for filtering structured data, e.g.

Does this timestamp fall into the range 2015 to 2016?
Is the status field set to "published"?
Frequently used filters will be cached automatically by Elasticsearch, to speed up performance.

Filter context is in effect whenever a query clause is passed to a filter parameter, such as the filter or must_not parameters in the bool query, the filter parameter in the constant \_score query, or the filter aggregation.


`x = es.search('star', _source_include='user_id', size=1000)`

> ```python
> {u'_shards': {u'failed': 0, u'skipped': 0, u'successful': 5, u'total': 5},
>  u'hits': {u'hits': [{u'_id': u'0',
>     u'_index': u'star',
>     u'_score': 1.0,
>     u'_source': {u'user_id': 1111},
>     u'_type': u'star'},
>    {u'_id': u'1',
>     u'_index': u'star',
>     u'_score': 1.0,
>     u'_source': {},
>     u'_type': u'star'}],
>   u'max_score': 1.0,
>   u'total': 2},
>  u'timed_out': False,
>  u'took': 2}
> ```

> ```python
> In [58]: x.keys()
> Out[58]: [u'hits', u'_shards', u'took', u'timed_out']
> 
> In [59]: x['hits'].keys()
> Out[59]: [u'hits', u'total', u'max_score']
> 
> In [60]: x['hits']['hits']
> Out[60]:
> [{u'_id': u'0',
>   u'_index': u'star',
>   u'_score': 1.0,
>   u'_source': {u'user_id': 1111},
>   u'_type': u'star'},
>  {u'_id': u'1',
>   u'_index': u'star',
>   u'_score': 1.0,
>   u'_source': {},
>   u'_type': u'star'}]
> ```
### filter

```python
def star_search(star_name):
    search_body = dict(
        query={
            'bool': dict(
                must=[
                    # dict(
                    #     term=dict(
                    #         tags=u'王一'
                    #     ),
                    # ),
                    # dict(
                    #     term=dict(
                    #         tags=u'王二'
                    #     ),
                    # )
                ]
            )
        },
    )
    for name in star_name:
        search_body['query']['bool']['must'].append(dict(
            term=dict(
                tags=name,
            ),
        ))
    return search_body
```

### bool
#### should
> ```python
> In [99]: should_search
> Out[99]:
> {'query': {'bool': {'should': [{'term': {'tags': u'\u674e\u56db'}},
>     {'term': {'tags': u'\u738b\u4e94'}}]}}}
> ```

> ```python
> {'query': {'bool': {'should': {'terms': {'tags': [u'\u738b\u56db',
>       u'\u738b\u4e94']}}}}}
> ```

#### must
> ```
> In [100]: must_search
> Out[100]:
> {'query': {'bool': {'must': [{'term': {'tags': u'\u674e\u56db'}},
>     {'term': {'tags': u'\u738b\u4e94'}}]}}}
> ```

### match


### 判断某个字段是否存在

**查找包含user字段的文档**
```
GET /_search
{
    "query": {
        "exists": {
            "field": "user"
        }
    }
}
```

**过滤不包含user字段的文档**
```
GET /_search
{
    "query": {
        "bool": {
            "must_not": {
                "exists": {
                    "field": "user"
                }
            }
        }
    }
}
```

### should最少匹配多少次
**minimum_should_match**
> ```
> POST _search
> {
>   "query": {
>     "bool" : {
>       "must" : {
>         "term" : { "user" : "kimchy" }
>       },
>       "should" : [
>         { "term" : { "tag" : "wow" } },
>         { "term" : { "tag" : "elasticsearch" } }
>       ]
>       # default:
>       # "minimum_should_match" : 0
>     }
>   }
> }
> ```

### phrase_match

按照短语进行匹配
```python
{
    'query': 
    {
        'match_phrase': {
            'full_text': u'\u8fb9\u4f2f\u8d24 \u6f14\u5531\u4f1a'
        }
    },
    'sort': 
    {
        'last_export_at': 'desc'
    }
}
```


## sort 

> ```
> {'_source': 'fragment_asset_key',
>  'query': {'bool': {'filter': [{'term': {'name_tag': u'\u6d88\u606f'}}]}},
>  'sort': {'last_export_at': 'desc'}}
> ```
