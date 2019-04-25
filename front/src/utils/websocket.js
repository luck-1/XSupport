const webSocketUrl = process.env.BASE_API.replace('http://', 'ws://') + 'websocket'

function init(webSocket) {
  debugger
  let result = null
  webSocket.onopen = () => console.log("websocket连接成功")
  webSocket.onclose = () => console.log("websocket关闭链接")
  webSocket.onerror = () => console.log("websocket连接错误")
  webSocket.onmessage = (res) => result = res.data
  return result
}

export default {
  webSocketUrl,
  onopen: () => console.log("websocket连接成功"),
  onclose: () => console.log("websocket关闭链接"),
  onerror: () => console.log("websocket连接错误")
}
