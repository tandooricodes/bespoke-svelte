<script>
	import Navbar from '../navbar/navbar.svelte';
	import Sidebar from '../sidebar/sidebar.svelte';
	import PageContainer from '../page-container/page-container.svelte';

	/** @type {{
	 *   sidebarItems: Array<{ label: string, icon: new (...args: any[]) => import('svelte').SvelteComponent, path: string }>,
	 *   title?: string,
	 *   children?: import('svelte').Snippet,
	 *   navbarEnd?: import('svelte').Snippet
	 * }} */
	let { sidebarItems, title = '', children, navbarEnd } = $props();

	let collapsed = $state(true);
	let maskVisible = $state(false);
	/** @type {ReturnType<typeof setTimeout> | undefined} */
	let pendingToggle;

	const toggleCollapsed = () => {
		if (pendingToggle !== undefined) {
			clearTimeout(pendingToggle);
			pendingToggle = undefined;
		}
		if (collapsed) {
			maskVisible = true;
			pendingToggle = setTimeout(() => { collapsed = false; pendingToggle = undefined; }, 150);
		} else {
			collapsed = true;
			pendingToggle = setTimeout(() => { maskVisible = false; pendingToggle = undefined; }, 150);
		}
	};
</script>

{#snippet navbarChildren()}
	{@render navbarEnd?.()}
{/snippet}

<div class="relative h-screen overflow-hidden">
	<Navbar
		{title}
		sidebarCollapsed={collapsed}
		toggleSidebarCollapse={toggleCollapsed}
		children={navbarChildren}
	/>
	<Sidebar {sidebarItems} {collapsed} />
	<div
		role="button"
		tabindex={maskVisible ? 0 : -1}
		aria-label="Close sidebar"
		aria-hidden={!maskVisible}
		class="absolute top-12 right-0 bottom-0 left-0 z-30 backdrop-blur-sm transition-opacity duration-150 ease-in-out {maskVisible
			? 'opacity-100 pointer-events-auto'
			: 'opacity-0 pointer-events-none'}"
		onclick={toggleCollapsed}
		onkeydown={(e) => (e.key === 'Enter' || e.key === ' ') && toggleCollapsed()}
	></div>
	<div class="absolute top-0 right-0 bottom-0 left-0 overflow-y-auto">
		<PageContainer>
			{@render children?.()}
		</PageContainer>
	</div>
</div>
