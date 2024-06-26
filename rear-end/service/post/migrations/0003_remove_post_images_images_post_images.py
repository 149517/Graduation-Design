# Generated by Django 5.0 on 2024-04-08 06:00

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('post', '0002_post_images'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='images',
        ),
        migrations.CreateModel(
            name='Images',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='post_img')),
                ('description', models.TextField(blank=True)),
                ('upload_time', models.DateTimeField(auto_now_add=True)),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='image_set', to='post.post')),
            ],
        ),
        migrations.AddField(
            model_name='post',
            name='images',
            field=models.ManyToManyField(blank=True, related_name='posts', to='post.images'),
        ),
    ]
