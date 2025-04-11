<template>
    <cAdminViewallBookcover :allPremadeBookcovers="allPremadeBookcover" :getcAdmin_images="getAdminImage"/>
</template>

<script>
import cAdminViewallBookcover from '../Components/AdminViewallBookcover/cAdminViewallBookcover.vue';
export default {
    name: 'AdminViewallBookCover',
    components:{cAdminViewallBookcover},
    props: {allPremadeBookcover:Object, getAdminImage:Object}
}
</script>

<style>

</style>
