<template>
    <cMembershipReset :email="email" :token="token" :get_userLogos="get_userLogo"/>
</template>

<script>
import cMembershipReset from '../Components/MembershipReset/cMembershipReset.vue';
export default {
    name: 'MembershipReset',
    components: {cMembershipReset},
    props: {email:String, token:String, get_userLogo:Object}
}
</script>

<style></style>
