{%- set payment_methods = ["Digital Wallet", "Cash", "Card"] -%}

{% for i in payment_methods %}

    {% if i == "Digital Wallet" %}

        {{ i }} is the most convenient payment method

    {% elif i == "Card" %}

        {{ i }} is widely accepted everywhere

    {% else %}

        {{ i }} is still king for small purchases

    {% endif %}

{% endfor %}