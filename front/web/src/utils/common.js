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
  }
}
