<template>
    <cAdminOrders :getcAdmin_images="getAdminImage" :get_pendingCustomers="get_pendingCustomer"
        :get_pendingItems="get_pendingItem" :get_shipmentCutomers="get_shipmentCutomer" :get_shipmentItems="get_shipmentItem" :get_completedCutomers="get_completedCutomer" :get_completedItems="get_completedItem"/>
</template>

<script>
import cAdminOrders from '../Components/AdminOrders/cAdminOrders.vue';
export default {
    name: 'AdminOrders',
    components: { cAdminOrders },
    props: { getAdminImage: Object, get_pendingCustomer: Object, get_pendingItem: Array, get_shipmentCutomer:Object, get_shipmentItem:Array, get_completedCutomer:Object, get_completedItem:Array }
}
</script>

<style></style>
