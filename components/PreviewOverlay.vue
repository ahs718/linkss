<template>
    <div
        id="PreviewOverlay"
        class="md:hidden fixed bg-white z-30 top-0 left-0 h-full w-full overflow-auto"
        :class="userStore.theme?.color"
    >
        <div
            id="PreviewOverlayTopNav"
            class="w-full fixed z-10 flex items-center justify-between"
        >
            <div
                class="flex items-center justify-between p-2 pl-4 bg-white w-full border-b"
            >
                <div class="flex items-center justify-start w-full">
                    <button
                        @click="
                            ($event) => (userStore.isPreviewOverlay = false)
                        "
                    >
                        <img
                            class="w-[23px] min-w-[23px] select-none"
                            src="~/assets/images/linktree-logo-icon.png"
                        />
                    </button>
                </div>

                <div class="flex items-center justify-between gap-3">
                    <button
                        class="flex items-center text-sm font-semibold p-2 rounded-full hover:bg-gray-100"
                    >
                        <Icon
                            name="healthicons:megaphone-outline"
                            class="mr-0.5"
                            size="22"
                        />
                    </button>

                    <button
                        class="flex items-center font-semibold px-3 py-2 rounded-full bg-gray-100"
                    >
                        <Icon
                            name="mdi:lightning-bolt-outline"
                            class="mr-0.5"
                            size="18"
                        />
                        Upgrade
                    </button>

                    <button
                        class="flex items-center font-semibold px-3 py-2 rounded-full border hover:bg-gray-100"
                    >
                        <Icon
                            name="teenyicons:upload-solid"
                            class="mr-1.5"
                            size="18"
                        />
                        Share
                    </button>
                </div>
            </div>
        </div>

        <div
            id="PreviewOverlayContentSection"
            class="relative w-full h-full mx-auto pt-24"
        >
            <div class="mx-auto mb-16 w-full p-3">
                <div class="h-full mx-auto w-full overflow-auto z-10">
                    <!-- :src="userStore.image" -->
                    <img
                        class="rounded-full min-w-[100px] w-[100px] mx-auto"
                        src="https://picsum.photos/id/8/300/320"
                    />

                    <div
                        class="text-center text-xl font-semibold mt-4"
                        :class="userStore.theme?.text"
                    >
                        @ahs
                    </div>

                    <div
                        class="text-center font-light mt-2"
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
                                class="rounded-lg h-[45px] aspect-square"
                                :src="link.image"
                            />

                            <div class="absolute text-base text-center w-full">
                                {{ link.name }}
                            </div>
                        </a>
                    </div>

                    <div class="pb-28" />
                </div>
            </div>
        </div>

        <div
            id="PreviewButton"
            class="fixed bottom-10 w-full flex items-center justify-center"
        >
            <button
                @click="($event) => (userStore.isPreviewOverlay = false)"
                class="flex items-center justify-center p-2.5 bg-[#dfe2d9] rounded-full"
            >
                <Icon name="mdi:close" size="30" />
            </button>
        </div>
    </div>
</template>

<script setup>
import { useUserStore } from "~/stores/user";

const userStore = useUserStore();

onUnmounted(() => (userStore.isPreviewOverlay = false));

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
