<template>
    <cIndexVue :get1_romancePremades="get1_romancePremade" :get1_premadebookCovers="get1_premadebookCover" :get1_affordablepremades="get1_affordablepremade" :get_latestitems="get_latestitem" :get_PremadeWallpapers="get_PremadeWallpaper" :get_lastItems="get_lastItem" :userCarts="userCart"/>
</template>

<script>
import cIndexVue from '../Components/Index/cIndex.vue'
export default {
    components: { cIndexVue },
    props: { get1_romancePremade: Object, get1_premadebookCover:Object, get1_affordablepremade:Object , get_latestitem:Object, get_PremadeWallpaper:Object, get_lastItem:Object, userCart: Object}
}
//1C1C1E
</script>

<style>
* {
    margin: 0;
    padding: 0;
    background-color: #1C1C1E;
}
</style>
