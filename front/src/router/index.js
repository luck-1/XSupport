import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const keepAlive = true
const noKeepAlive = false

const requireAuth = true
const noRequireAuth = false


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
          component: () => import('../page/manage/user'),
          meta: {title: "用户管理", keepAlive: noKeepAlive, requireAuth: requireAuth}
        },
        {
          path: 'video',
          name: 'video',
          component: () => import('../page/manage/video'),
          meta: {title: "视频监控", keepAlive: noKeepAlive, requireAuth: requireAuth}
        },
        {
          path: 'map',
          name: 'map',
          component: () => import('../page/manage/map'),
          meta: {title: "地图监测", keepAlive: keepAlive, requireAuth: requireAuth}
        },
        {
          path: 'system',
          name: 'system',
          component: () => import('../page/manage/system'),
          meta: {title: "系统管理", keepAlive: noKeepAlive, requireAuth: requireAuth}
        },
        {
          path: 'measure/temperature',
          name: 'temperature',
          component: () => import('../page/measure/temperature'),
          meta: {title: "温度测量", keepAlive: keepAlive, requireAuth: requireAuth}
        },
        {
          path: 'measure/humidity',
          name: 'humidity',
          component: () => import('../page/measure/humidity'),
          meta: {title: "湿度测量", keepAlive: keepAlive, requireAuth: requireAuth}
        },
        {
          path: 'measure/soak',
          name: 'soak',
          component: () => import('../page/measure/soak'),
          meta: {title: "浸润测量", keepAlive: keepAlive, requireAuth: requireAuth}
        },
        {
          path: 'measure/gas',
          name: 'gas',
          component: () => import('../page/measure/gas'),
          meta: {title: "金气测量", keepAlive: keepAlive, requireAuth: requireAuth}
        },
        {
          path: 'measure/displacement',
          name: 'displacement',
          component: () => import('../page/measure/displacement'),
          meta: {title: "位移测量", keepAlive: keepAlive, requireAuth: requireAuth}
        }
      ]
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../page/login'),
      meta: {title: "登录", keepAlive: noKeepAlive, requireAuth: noRequireAuth}
    },
    {
      path: '/swagger',
      name: 'swagger',
      component: () => import('../page/manage/swagger'),
      redirect: 'http://localhost:8082/swagger-ui.html',
      meta: {title: "接口调试", keepAlive: noKeepAlive, requireAuth: noRequireAuth}
    },
    {
      path: '/404',
      component: () => import('../page/404')
    },
    {
      path: '*', redirect: '/404'
    }
  ]
})

router.beforeEach((to, from, next) => {
  if (to.meta.requireAuth) {
    localStorage.getItem('token') === null ? next({path: '/login'}) : next()
  } else {
    next()
  }
})

export default router
