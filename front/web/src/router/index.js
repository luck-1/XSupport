import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const keepAlive = false

export default new Router({

  routes: [
    {
      path: '/',
      redirect: '/user',
      name: 'home',
      component: () => import('../page/common/home'),
      children: [
        {
          path: 'user',
          name: 'user',
          component: () => import('../page/user'),
          meta: {title: "用户管理", keepAlive: keepAlive}
        },
        {
          path: 'monitor',
          name: 'monitor',
          component: () => import('../page/monitor'),
          meta: {title: "视频监控", keepAlive: keepAlive}
        },
        {
          path: 'rimArea',
          name: 'rimArea',
          component: () => import('../page/rimArea'),
          meta: {title: "地图监测", keepAlive: keepAlive}
        },
        {
          path: 'system',
          name: 'system',
          component: () => import('../page/system'),
          meta: {title: "系统管理", keepAlive: keepAlive}
        },
        {
          path: 'measure', name: 'measure', children: [
            {
              path: 'temperature',
              name: 'temperature',
              component: () => import('../page/measure/temperature'),
              meta: {title: "温度测量", keepAlive: keepAlive}
            },
            {
              path: 'humidity',
              name: 'humidity',
              component: () => import('../page/measure/humidity'),
              meta: {title: "湿度测量", keepAlive: keepAlive}
            },
            {
              path: 'soak',
              name: 'soak',
              component: () => import('../page/measure/soak'),
              meta: {title: "浸润测量", keepAlive: keepAlive}
            },
            {
              path: 'gas',
              name: 'gas',
              component: () => import('../page/measure/gas'),
              meta: {title: "金气测量", keepAlive: keepAlive}
            }
          ]
        },
      ]
    },
    {path: '/login', name: 'login', component: () => import('../page/login')},
    {path: '/404', component: () => import('../components/404')},

    {path: '*', redirect: '/404'}
  ]
})
