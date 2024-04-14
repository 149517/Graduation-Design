<template>
  <a-space>
    <a-select
        ref="select"
        v-model:value="value1"
        style="width: 120px"
        @focus="focus"
        @change="handleChange"
    >
      <a-select-option v-for="option in options1" :key="option.value" :value="option.value">
        {{ option.label }}
      </a-select-option>
    </a-select>
  </a-space>
</template>

<script setup>
import {ref, defineEmits, computed, watch, onMounted} from 'vue';
import {useStore} from "vuex";

const props = defineProps({
  value: Number // 定义 value 为字符串类型
});
const value = props.value

const value1 = ref('未完成');

const getValue = () => {
  if (value === 1) {
    value1.value = "未完成"
  }
  if (value === 0) {
    value1.value = "进行中"
  }
  if (value === -1) {
    value1.value = "已完成"
  }
}

const options1 = ref([
  {value: '1', label: "未完成"},
  {value: '0', label: '进行中'},
  {value: '-1', label: '已完成'}
]);

const store = useStore()
// 需要通过 click 的变化触发函数，将图片传递到父组件一起发送
const click = computed(() => store.state.send)

const emit = defineEmits(['sending'])
watch(click, (newValue) => {
  if (newValue === true) {
    emit('sending', value1.value)
  }
})
// const focus = () => {
//   console.log('focus');
// };

const handleChange = (value) => {
  // console.log(`selected ${value}`);
  // 发送选中的值给父组件
  emit('selectChange', value);
};

onMounted(() => {
  getValue()
})
</script>
