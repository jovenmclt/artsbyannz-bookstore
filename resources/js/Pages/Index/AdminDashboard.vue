<template>
    <cAdminDashboard :getcAdmin_images="getAdminImage" :allUsers="allUsers" :get_sales="get_sale" :get_incomes="get_income" :get_recentPurchase="get_recentPurchase" :get_itemTypes="get_itemType"/>
</template>

<script>
import cAdminDashboard from '../Components/AdminDashboard/cAdminDashboard.vue';
export default {
    name: 'AdminDashboard',
    components: { cAdminDashboard },
    props: {getAdminImage: Object, allUsers:Array, get_sale:Array, get_income:Array, get_recentPurchase:Array, get_itemType:Array}
}
</script>

<style></style>
