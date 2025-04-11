<template>
    <cReceipt :latestCheckouts="latestCheckout" />
</template>

<script>
import cReceipt from '../Components/Receipt/cReceipt.vue';
export default {
    name: 'Receipt',
    components: { cReceipt },
    props: { latestCheckout: Object }
}
</script>

<style></style>
