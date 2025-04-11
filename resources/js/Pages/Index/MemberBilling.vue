<template>
    <cMemberBillingVue :userIds="userId" :userInfos="userInfo" :userCarts="userCart" :transactions="transaction"/>
</template>

<script>
import cMemberBillingVue from '../Components/MemberBilling/cMemberBilling.vue'
export default {
    name: 'MemberBilling',
    components:{cMemberBillingVue},
    props: {userId:Number, userInfo:Object, userCart:Object, transaction:Array}
}
</script>

<style>

</style>
