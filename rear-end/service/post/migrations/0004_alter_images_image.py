# Generated by Django 5.0 on 2024-04-09 02:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('post', '0003_remove_post_images_images_post_images'),
    ]

    operations = [
        migrations.AlterField(
            model_name='images',
            name='image',
            field=models.ImageField(upload_to='static/post_img'),
        ),
    ]
