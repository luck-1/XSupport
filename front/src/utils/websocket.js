const webSocketUrl = process.env.BASE_API.replace('http://', 'ws://') + 'websocket'

//保存图片等操作
const toolbox = {
  feature: {dataZoom: {yAxisIndex: 'none'}, restore: {}, saveAsImage: {}}
}

const grid = {
  top: '10%', left: '8%', right: '8%', bottom: '5%', containLabel: true
}

export default {
  webSocketUrl, toolbox, grid
}
