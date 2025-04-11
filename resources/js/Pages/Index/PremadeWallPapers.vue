<template>
    <cPremadeWallPaperVue :userCarts="userCart"  :get_premadeWallPapers="get_premadeWallPaper"/>
</template>

<script>
import cPremadeWallPaperVue from '../Components/PremadeWallPaper/cPremadeWallPaper.vue'
export default {
    name: 'PremadeWallPapers',
    components: {cPremadeWallPaperVue},
    props: {get_premadeWallPaper:Object, userCart: Object}
}
</script>

<style>

</style>
