import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const keepAlive = false

const router = new Router({
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
          path: 'video',
          name: 'video',
          component: () => import('../page/video'),
          meta: {title: "视频监控", keepAlive: keepAlive}
        },
        {
          path: 'map',
          name: 'map',
          component: () => import('../page/map'),
          meta: {title: "地图监测", keepAlive: keepAlive}
        },
        {
          path: 'system',
          name: 'system',
          component: () => import('../page/system'),
          meta: {title: "系统管理", keepAlive: keepAlive}
        },
        {
          path: 'measure/temperature',
          name: 'temperature',
          component: () => import('../page/measure/temperature'),
          meta: {title: "温度测量", keepAlive: keepAlive}
        },
        {
          path: 'measure/humidity',
          name: 'humidity',
          component: () => import('../page/measure/humidity'),
          meta: {title: "湿度测量", keepAlive: keepAlive}
        },
        {
          path: 'measure/soak',
          name: 'soak',
          component: () => import('../page/measure/soak'),
          meta: {title: "浸润测量", keepAlive: keepAlive}
        },
        {
          path: 'measure/gas',
          name: 'gas',
          component: () => import('../page/measure/gas'),
          meta: {title: "金气测量", keepAlive: keepAlive}
        }
      ]
    },
    {path: '/login', name: 'login', component: () => import('../page/login')},
    {path: '/404', component: () => import('../components/404')},

    {path: '*', redirect: '/404'}
  ]
})

// router.beforeEach((to, from, next) => {
//   if (localStorage.getItem('accessToken') === null) {
//     next({path: '/login'})
//   } else {
//     next()
//   }
// })

export default router
