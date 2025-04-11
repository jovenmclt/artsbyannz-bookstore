<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <AdminNavigation :propsAdmin_images="adminImages" />
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-4">
                <section id="sectionOverview">
                    <div class="row justify-content-start">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary">
                                <span class="fw-light">Membership > View all post</span>
                            </a>
                            <div class="d-flex justify-content-between py-3">
                                <h4 class="fw-semibold text-white">All Premade Posts</h4>
                                <inertiaLink href="/admin/membership/newpost" class="text-decoration-none me-xl-3">
                                    <button class="btn btn-dark border-secondary me-xl-5 rounded-3">
                                        New Post
                                    </button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-4 mt-xl-0 mt-2">
                            <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary bg-transparent">Post</span>
                                <h1 class="fw-bold text-white bg-transparent">{{ premadePosts.length }}</h1>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-4 mt-xl-0 mt-2">
                            <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary bg-transparent">Likes</span>
                                <h1 class="fw-bold text-white bg-transparent">{{ totalLikes.length }}</h1>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-4 mt-xl-0 mt-2">
                            <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary bg-transparent">Comments</span>
                                <h1 class="fw-bold text-white bg-transparent">{{ getall_comments.length }}</h1>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sectionPosts">
                    <div class="row justify-content-start">
                        <div class="col-xl-11 col-md-12 py-5 px-xl-4 bg-dark border border-secondary mt-xl-5 mt-3 ms-xl-3 rounded-4" v-for="(post, index) in premadePosts" :key="index">
                            <div class="row px-xl-5 px-3 bg-transparent">
                                <div class="text-end bg-transparent pb-4">
                                    <div class="btn-group dropend bg-transparent">
                                        <div class=" bg-transparent" data-bs-toggle="dropdown">
                                            <i class="bi bi-three-dots bg-transparent ms-2 text-white" style="cursor:pointer"></i>
                                        </div>
                                        <ul class="dropdown-menu mt-3 bg-dark rounded-4 z-1">
                                            <li class="bg-transparent border-bottom mx-2">
                                                <inertiaLink :href="`/editpost/${post.id}`" class="dropdown-item text-white bg-transparent" > Edit post</inertiaLink>
                                            </li>
                                            <li class="bg-transparent px-2">
                                                <button class="btn bg-transparent shadow-none text-white" @click="deleltePost(post.id)">
                                                    Delete post
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-6 p-1" v-for="(image, imgIndex) in parseImages(post.post_images)" :key="imgIndex">
                                    <div class="ratio ratio-1x1">
                                        <img :src="`/storage/${image}`" alt="Premade Post Image" class="w-100 h-100 object-fit-cover" />
                                    </div>
                                </div>
                                <div class="text-start bg-transparent mt-3">
                                    <p class="fw-light text-secondary bg-transparent">
                                        {{ new Date(post.created_at).toLocaleDateString('en-US', {year:'numeric', month: 'short', day: 'numeric'}) }}
                                    </p>
                                    <p class="fw-light text-white bg-transparent" v-html="post.caption.replace(/(\r\n|\n|\r)/g, '<br>')" style="font-size: 15px;"></p>
                                    <div class="d-flex bg-transparent gap-3">
                                        <div v-if="!isPostLiked(post.premadelike)" class="bg-transparent">
                                            <button class="btn btn-outline-secondary px-4 rounded-5" @click="likePost(post.id)">
                                                <span class="bg-transparent">
                                                    <i class="bi bi-heart-fill bg-transparent"></i>
                                                    {{ post.premadelike.length }}
                                                </span>
                                            </button>
                                        </div>
                                        <div v-else class="bg-transparent">
                                            <button class="btn btn-secondary px-4 rounded-5" @click="likePost(post.id)">
                                                <span class="bg-transparent">
                                                    <i class="bi bi-heart-fill bg-transparent"></i>
                                                    {{ post.premadelike.length }}
                                                </span>
                                            </button>
                                        </div>
                                        <div class="bg-transparent">
                                            <button class="btn btn-outline-secondary px-4 rounded-5">
                                                <span class="bg-transparent">
                                                    <i class="bi bi-chat-left-fill bg-transparent"></i> {{ post.premadecomment.length }}
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                    <form action="" class="bg-transparent mt-3" @submit.prevent="addComment(post.id)">
                                        <div class="input-group bg-transparent min-w-100 z-1">
                                            <img :src="`/storage/${userProfileImage}`" alt="" class="rounded-5 mt-1" width="60" height="55">
                                            <textarea id="commentText" class="form-control mx-2 rounded-4 shadow-none bg-secondary border-dark text-white" placeholder="Write a comment..." v-model="comments[post.id]"></textarea>
                                            <button class="btn" type="submit">
                                                <i class="bi bi-send-fill fs-3 bg-transparent" style="color: #B38ED1;"></i>
                                            </button>
                                        </div>
                                    </form>
                                    <div class="text-start bg-transparent mt-4 ps-1"  v-for="(comment, index) in post.premadecomment" :key="index">
                                        <div class="d-flex bg-transparent mt-4" v-if="comment.parent_id === null">
                                            <div class="text-start bg-transparent">
                                                <img :src="`/storage/${comment.user.file_profile}`" alt="" class="rounded-5 mt-1" width="50" height="45">
                                            </div>
                                            <div class="text-start bg-transparent ms-2 w-100">
                                                <span class="fw-semibold text-white bg-transparent" style="font-size: 13px;">{{ comment.user.fullname }}</span>
                                                <div class="btn-group dropend bg-transparent">
                                                    <div class=" bg-transparent" data-bs-toggle="dropdown">
                                                        <i class="bi bi-three-dots bg-transparent ms-2 text-white" style="cursor:pointer"></i>
                                                    </div>
                                                    <ul class="dropdown-menu mt-3 bg-dark  rounded-4">
                                                        <li class="bg-transparent">
                                                            <inertiaLink :href="`/delcomment/${comment.id}`" class="dropdown-item text-white bg-transparent" > Delete</inertiaLink>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <br>
                                                <span class="fw-light text-white bg-transparent" style="font-size: 14px;">{{ comment.comment_text }}</span>
                                                <br>
                                                <div class="d-flex bg-transparent">
                                                    <div v-if="!isreactComment(comment.commentreaction)" class="bg-transparent">
                                                        <button class="btn btn-outline-secondary rounded-5" style="font-size: 10px;"  @click="reactComment(comment.id)">
                                                            <span class="bg-transparent">
                                                                <i class="bi bi-heart-fill bg-transparent"></i> {{ comment.commentreaction.length }}
                                                            </span>
                                                        </button>
                                                    </div>
                                                    <div v-else class="bg-transparent">
                                                        <button class="btn btn-secondary rounded-5" style="font-size: 10px;"  @click="reactComment(comment.id)">
                                                            <span class="bg-transparent">
                                                                <i class="bi bi-heart-fill bg-transparent"></i> {{ comment.commentreaction.length }}
                                                            </span>
                                                        </button>
                                                    </div>
                                                    <button class="btn rounded-5" style="font-size: 12px;" @click="showReplyInput(comment.id)">
                                                        <span class="bg-transparent text-white">
                                                            <i class="bi bi-chat-left-fill bg-transparent"></i> Reply
                                                        </span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex bg-transparent mt-2 ms-5" v-for="(reply, replyIndex) in post.premadecomment.filter(c => comment.id === c.parent_id)" :key="replyIndex">
                                            <div class="text-start bg-transparent">
                                                <img :src="`/storage/${reply.user.file_profile}`" alt="" class="rounded-5 mt-1" width="50" height="45">
                                            </div>
                                            <div class="text-start bg-transparent ms-2 w-100">
                                                <span class="fw-semibold text-white bg-transparent" style="font-size: 13px;">{{ reply.user.fullname }}</span>
                                                <div class="btn-group dropend bg-transparent">
                                                    <div class=" bg-transparent" data-bs-toggle="dropdown">
                                                        <i class="bi bi-three-dots bg-transparent ms-2 text-white" style="cursor:pointer"></i>
                                                    </div>
                                                    <ul class="dropdown-menu mt-3 bg-dark  rounded-4">
                                                        <li class="bg-transparent">
                                                            <inertiaLink :href="`/delcomment/${reply.id}`" class="dropdown-item text-white bg-transparent" > Delete</inertiaLink>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <br>
                                                <span class="fw-light text-white bg-transparent" style="font-size: 14px;">{{ reply.comment_text }}</span>
                                                <br>
                                                <div class="d-flex bg-transparent mt-1">
                                                    <div v-if="!isreactComment(reply.commentreaction)" class="bg-transparent">
                                                        <button class="btn btn-outline-secondary rounded-5" style="font-size: 10px;"  @click="reactComment(reply.id)">
                                                            <span class="bg-transparent">
                                                                <i class="bi bi-heart-fill bg-transparent"></i> {{ reply.commentreaction.length }}
                                                            </span>
                                                        </button>
                                                    </div>
                                                    <div v-else class="bg-transparent">
                                                        <button class="btn btn-secondary rounded-5" style="font-size: 10px;"  @click="reactComment(reply.id)">
                                                            <span class="bg-transparent">
                                                                <i class="bi bi-heart-fill bg-transparent"></i> {{ reply.commentreaction.length }}
                                                            </span>
                                                        </button>
                                                    </div>
                                                    <button class="btn rounded-5" style="font-size: 12px;" @click="showReplyInput(reply.parent_id)">
                                                        <span class="bg-transparent text-white">
                                                            <i class="bi bi-chat-left-fill bg-transparent"></i> Reply
                                                        </span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="min-w-75 bg-transparent ms-lg-5">
                                            <form action="" class="bg-transparent mt-3" v-if="activeCommentId === comment.id" @submit.prevent="addReply(post.id)">
                                                <div class="input-group bg-transparent w-100 z-1">
                                                    <img :src="`/storage/${userProfileImage}`" alt="" class="rounded-5 mt-1" width="50" height="45">
                                                    <textarea id="replyComments" class="form-control mx-2 rounded-4 shadow-none bg-secondary border-dark text-white" placeholder="Write a reply..." v-model="replyText"></textarea>
                                                    <button class="btn" type="submit">
                                                            <i class="bi bi-send-fill fs-3 bg-transparent" style="color: #B38ED1;"></i>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</template>

<script>
import AdminNavigation from "../AdminNavbar/AdminNavigation.vue";
import { Link as inertiaLink } from "@inertiajs/vue3";
import { router } from "@inertiajs/vue3";
export default {
    name: "AdminViewAllPosts",
    components: { AdminNavigation, inertiaLink },
    props: {
        adminImages: Object,
        premadePosts: Array,
        totalLikes: Array,
        userId: Number,
        userInfo: Object,
        getall_comments:Array
    },
    data() {
        return {
            userProfileImage: this.userInfo ? this.userInfo.file_profile : '',
            selectedPostId: '',
            comments: {},
            replyText: '',
            activeCommentId: null,
            selectedCommentId: ''
        };
    },
    methods: {
        parseImages(jsonString) {
            return JSON.parse(jsonString);
        },
        likePost(postId) {
            this.selectedPostId = postId;
            const data = {
                postId: this.selectedPostId,
            };
            router.post('/storeLikes', data);
        },
        isPostLiked(likes) {
            return likes.some((like) => like.user_id === this.userId);
        },
        addComment(postId) {
            this.selectedPostId = postId;
            if (this.comments[this.selectedPostId]) {
                const data = {
                    newComment: this.comments[this.selectedPostId],
                    postId: this.selectedPostId,
                };
                router.post('/storeComment', data);
                this.comments = {};
            }
        },
        showReplyInput(commentId) {
            this.activeCommentId = commentId;
            this.$nextTick(() => {
                const replyInput = document.getElementById('replyComments');
                if (replyInput) {
                    replyInput.focus();
                }
            });
        },
        addReply(postId) {
            this.selectedPostId = postId;
            const data = {
                comment_post_id: this.selectedPostId,
                comment_text: this.replyText,
                parent_id: this.activeCommentId,
            };
            router.post('/storeReply', data);
            this.activeCommentId = null;
            this.replyText = ''
        },
        reactComment(commentID){
            this.selectedCommentId = commentID
            if(this.selectedCommentId){
                const data = {
                    reaction_comment_id: this.selectedCommentId
                }
                router.post('/storeReactcomment', data);
            }
            console.log(this.selectedCommentId);
        },
        isreactComment(react){
            return react.some((reacts) => reacts.reaction_user_id === this.userId)
        },
        deleltePost(postId){
            let confirm_delete = confirm('Are you sure, you want to delete this post?');
            if(confirm_delete){
                router.post(`/delpost/${[postId]}`);
            }
        }
    },
    mounted() {
        console.log(this.premadePosts);
    },
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

#sectionOverview {
    font-family: "Poppins", serif;
    padding-top: calc(60px + 1rem);
}

section {
    font-family: "Poppins", serif;
    padding-bottom: calc(20px + 1rem);
}
</style>
