<template>
    <cMemberMessageVue :userIds="userId" :userInfos="userInfo" :userCarts="userCart" />
</template>

<script>
import cMemberMessageVue from '../Components/MemberMessage/cMemberMessage.vue'
export default {
    name: 'MemberMessage',
    components:{cMemberMessageVue},
    props: {userId:Number, userInfo:Object, userCart: Object}
}
</script>

<style>

</style>
