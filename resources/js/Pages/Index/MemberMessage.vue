<template>
    <cMemberMessageVue :userIds="userId" :userInfos="userInfo" :userCarts="userCart" :messageConvos="messageConvo"/>
</template>

<script>
import cMemberMessageVue from '../Components/MemberMessage/cMemberMessage.vue'
export default {
    name: 'MemberMessage',
    components:{cMemberMessageVue},
    props: {userId:Number, userInfo:Object, userCart: Object, messageConvo:Array}
}
</script>

<style>

</style>
