<template>
    <cAdminViewallWallPaper :allPremadeWallpapers="allPremadeWallpaper" :getcAdmin_images="getAdminImage" />
</template>

<script>
import cAdminViewallWallPaper from '../Components/AdminViewallWallPaper/cAdminViewallWallPaper.vue';
export default {
    name: 'AdminViewallWallPaper',
    components:{cAdminViewallWallPaper},
    props:{allPremadeWallpaper:Object, getAdminImage:Object }
}
</script>

<style>

</style>
