# Generated by Django 4.2.9 on 2024-02-11 13:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Division',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32)),
            ],
        ),
        migrations.CreateModel(
            name='LectureSlot',
            fields=[
                ('id', models.CharField(max_length=64, primary_key=True, serialize=False, unique=True)),
                ('day', models.CharField(max_length=32)),
                ('startTime', models.TimeField()),
                ('endTime', models.TimeField()),
            ],
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('room_id', models.CharField(max_length=64, primary_key=True, serialize=False, unique=True)),
                ('max_capacity', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('id', models.CharField(max_length=64, primary_key=True, serialize=False, unique=True)),
                ('name', models.CharField(max_length=256)),
                ('division', models.ManyToManyField(blank=True, related_name='divisions', to='resources.division')),
            ],
        ),
        migrations.CreateModel(
            name='Course',
            fields=[
                ('course_id', models.CharField(max_length=64, primary_key=True, serialize=False, unique=True)),
                ('name', models.CharField(max_length=128)),
                ('lectures', models.IntegerField()),
                ('capacity', models.IntegerField()),
                ('teachers', models.ManyToManyField(blank=True, related_name='teachers', to='resources.teacher')),
            ],
        ),
        migrations.CreateModel(
            name='Class',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='resources.course')),
                ('division', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='resources.division')),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='resources.room')),
                ('slot', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='resources.lectureslot')),
                ('teacher', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='resources.teacher')),
            ],
        ),
    ]
