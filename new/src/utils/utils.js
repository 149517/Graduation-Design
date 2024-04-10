// 创建一个函数来格式化时间
export const formatDate = (time) => {
    // 将 ISO 8601 格式的时间转换为 Date 对象
    const date = new Date(time);

    // 使用 Date 对象的方法获取年、月、日
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');

    // 拼接年、月、日并返回
    return `${year}-${month}-${day}`;
};
export default formatDate()