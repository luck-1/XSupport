export const common = {
  serialize: function (data) {
    if (!data) {
      return '';
    }
    let formatData = [];
    for (let item in data) {
      // 排除嵌套对象
      if (!data.hasOwnProperty(item)) {
        continue;
      }
      // 排除操作数是函数
      if (typeof data[item] === 'function') {
        continue;
      }
      let value = data[item];
      if (value) {
        value = value.toString();
      }
      item = encodeURIComponent(item);
      value = encodeURIComponent(value);
      formatData.push(item + '=' + value);
    }
    return formatData.join('&')
  },

  getTime: (dateTime)=>  {
    let time = new Date(dateTime)
    let hours = time.getHours() < 10 ? '0' + time.getHours() : time.getHours()
    let minutes = time.getMinutes() < 10 ? '0' + time.getMinutes() : time.getMinutes()
    let seconds = time.getSeconds() < 10 ? '0' + time.getSeconds() : time.getSeconds()
    return hours + ':' + minutes + ':' + seconds
  },
}
