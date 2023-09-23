<template>
    <div
        class="fixed overflow-auto w-full h-screen"
        :class="userStore.theme?.color"
    />
    <AdminLayout>
        <div id="PreviewAdminPage" class="w-full mx-auto pt-32 relative z-10">
            <div class="mx-auto w-full">
                <div class="h-full mx-auto w-full">
                    <!-- userStore.image -->
                    <img
                        class="rounded-full min-w-[120px] w-[120px] mx-auto"
                        src="https://picsum.photos/id/8/300/320"
                    />

                    <div
                        class="text-center text-2xl font-semibold mt-2"
                        :class="userStore.theme?.text"
                    >
                        @ahs
                    </div>

                    <div
                        class="text-center text-lg font-light mt-2 mb-10"
                        :class="userStore.theme?.text"
                    >
                        <div class="px-8">
                            {{ userStore.bio || "this is the bio section" }}
                        </div>
                    </div>

                    <!-- userStore.allLinks -->
                    <div v-for="link in fakeLink">
                        <a
                            :href="link.url"
                            target="_blank"
                            rel="noopener noreferrer"
                            class="flex items-center relative w-[calc(100%-10px)] mx-auto border bg-white mt-4 p-1 rounded-lg"
                        >
                            <img
                                class="rounded-lg h-[55px] aspect-square"
                                :src="link.image"
                            />

                            <div
                                class="absolute text-[20px] text-center w-full"
                            >
                                {{ link.name }}
                            </div>
                        </a>
                    </div>

                    <div class="pb-12" />
                </div>
            </div>
        </div>
    </AdminLayout>
</template>

<script setup>
import AdminLayout from "~/layouts/AdminLayout.vue";
import { useUserStore } from "~/stores/user";

const userStore = useUserStore();

const fakeLink = [
    {
        id: 1,
        name: "Github",
        url: "https://github.com/ahs718",
        image: "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
    },
    {
        id: 2,
        name: "LinkedIn",
        url: "https://www.linkedin.com/in/aiden-schulman",
        image: "https://img.freepik.com/premium-vector/square-linkedin-logo-isolated-white-background_469489-892.jpg",
    },
    {
        id: 3,
        name: "Instagram",
        url: "https://www.instagram.com/ahs718_",
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/600px-Instagram_logo_2022.svg.png?20220518162235",
    },
];
</script>
