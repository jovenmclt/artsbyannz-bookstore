<template>
    <cViewItemVue :userCarts="userCart" :get_viewItems="get_viewItem" :get_latestItems="get_latestItem"/>
</template>

<script>
import cViewItemVue from '../Components/ViewItem/cViewItem.vue'
export default {
    name: 'ViewItem',
    components: {cViewItemVue},
    props: {get_viewItem:Object, get_latestItem:Object,  userCart: Object}
}
</script>

<style>

</style>
