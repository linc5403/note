# Django admin 字段使用搜索

`ModelAdmin.raw_id_fields`
```
By default, Django’s admin uses a select-box interface () for fields that are ForeignKey. Sometimes you don’t want to incur the overhead of having to select all the related instances to display in the drop-down.

raw_id_fields is a list of fields you would like to change into an Input widget for either a ForeignKey or ManyToManyField:


class ArticleAdmin(admin.ModelAdmin):
    raw_id_fields = ("newspaper",)
The raw_id_fields Input widget should contain a primary key if the field is a ForeignKey or a comma separated list of values if the field is a ManyToManyField. The raw_id_fields widget shows a magnifying glass button next to the field which allows users to search for and select a value:
```
![raw_id_fields.png](https://docs.djangoproject.com/en/dev/_images/raw_id_fields.png)
