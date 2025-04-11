<template>
    <cCustomerDetails :getcAdmin_images="getAdminImage" :get_cutomerDetails="get_cutomerDetail" :get_customerPendings="get_customerPending" :get_customerShippeds="get_customerShipped" :get_customerCompleteds="get_customerCompleted" :get_CustomerCarts="get_CustomerCart"/>
</template>

<script>
import cCustomerDetails from '../Components/CustomerDetails/cCustomerDetails.vue';
export default {
    name: 'CustomerDetails',
    components: {cCustomerDetails},
    props: {getAdminImage:Object, get_cutomerDetail:Object, get_customerPending:Array, get_customerShipped:Array, get_customerCompleted:Array, get_CustomerCart:Array},
}
</script>

<style>

</style>
