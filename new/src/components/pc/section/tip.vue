<template>
  <div>
    <a-button @click="() => openNotificationWithIcon('success')">Success</a-button>
    <a-button @click="() => openNotificationWithIcon('info')">Info</a-button>
    <a-button @click="() => openNotificationWithIcon('warning')">Warning</a-button>
    <a-button @click="() => openNotificationWithIcon('error')">Error</a-button>
  </div>
</template>
<script setup>
import { notification } from 'ant-design-vue';
const openNotificationWithIcon = type => {
  notification[type]({
    message: 'Notification Title',
    description:
        'This is the content of the notification. This is the content of the notification. This is the content of the notification.',
  });
};
</script>