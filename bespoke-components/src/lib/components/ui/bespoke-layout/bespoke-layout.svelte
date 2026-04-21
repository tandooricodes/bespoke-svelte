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
	const toggleCollapsed = () => {
		collapsed = !collapsed;
	};
</script>

{#snippet navbarChildren()}
	{@render navbarEnd?.()}
{/snippet}

<Navbar
	{title}
	sidebarCollapsed={collapsed}
	toggleSidebarCollapse={toggleCollapsed}
	children={navbarChildren}
/>
<Sidebar {sidebarItems} {collapsed} />
{#if !collapsed}
	<!-- svelte-ignore a11y_click_events_have_key_events a11y_no_static_element_interactions -->
	<div class="fixed inset-0 top-12 z-30 backdrop-blur-sm" onclick={toggleCollapsed}></div>
{/if}
<PageContainer>
	{@render children?.()}
</PageContainer>
