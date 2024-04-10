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
import {ref, defineEmits, computed, watch} from 'vue';
import {useStore} from "vuex";


const value1 = ref('null');
const options1 = ref([
  {value: 'null',label: "选择类型"},
  {value: 'post', label: '社区'},
  {value: 'help', label: '互助'},
  {value: 'activity', label: '活动'},
  {value: 'goods', label: '商品'},
]);

const store = useStore()
// 需要通过 click 的变化触发函数，将图片传递到父组件一起发送
const click = computed(()=>store.state.send)

const emit = defineEmits(['sending'])
watch(click,(newValue)=>{
  if(newValue === true) {
    emit('sending',value1.value)
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
</script>
