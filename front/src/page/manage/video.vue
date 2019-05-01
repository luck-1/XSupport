<template>
  <div class="video-page">
    <video id="video-box" autoplay ></video>
    <el-button class="change-btn" @click="changeState" size="mini" type="warning">
      <span v-if="stop">打开摄像</span>
      <span v-else>关闭摄像</span>
    </el-button>
  </div>
</template>

<script>
  export default {
    name: "video-box",
    data() {
      return {
        infoBox: {video: true},
        stop: false
      }
    },
    mounted() {
      this.playVideo()
    },
    methods: {
      playVideo() {
        navigator.mediaDevices.getUserMedia(this.infoBox).then(this.success).catch(this.err);
      },
      success(stream) {
        let video = document.getElementById('video-box')
        // stream = !this.stop ? stream : stream.getTracks()[0].stop();
        video.src = URL.createObjectURL(stream)
      },
      err() {
        alert("启用摄像头错误 !")
      },
      changeState() {
        this.stop = !this.stop
        // mediaStreamTrack && mediaStreamTrack.stop();
      }

    }
  }
</script>

<style scoped>
  .video-page, #video-box {
    height: 100%;
    width: 100%;
  }

  .change-btn {
    position: fixed;
    right: 5px;
    top: 100px;
  }
</style>
