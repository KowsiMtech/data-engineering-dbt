{%- set project_name = "data-engineering-dbt" -%}
{%- set author = "Kowsalya Gopinathan" -%}
{%- set stack = ["dbt", "Databricks", "SQL", "Python", "Jinja"] -%}

Hi, I am {{ author }}, a passionate Data Engineer.
I built this project '{{ project_name }}' to demonstrate my skills in:

{% for tool in stack %}
  - {{ tool }}
{% endfor %}

I love transforming raw data into meaningful insights using modern data engineering tools.
