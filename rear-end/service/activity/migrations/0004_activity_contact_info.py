# Generated by Django 5.0 on 2024-05-04 09:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activity', '0003_discuss'),
    ]

    operations = [
        migrations.AddField(
            model_name='activity',
            name='contact_info',
            field=models.TextField(blank=True, default=None),
        ),
    ]
