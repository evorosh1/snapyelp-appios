# Generated by Django 3.2.12 on 2022-04-25 04:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0006_alter_profile_profile_photo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='profile_photo',
            field=models.CharField(max_length=100),
        ),
    ]
