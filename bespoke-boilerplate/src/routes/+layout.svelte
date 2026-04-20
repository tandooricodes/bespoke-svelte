<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';
	import { Navbar, PageContainer } from 'bespoke-components';

	let { children } = $props();
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
<Navbar title="Bespoke" />
<PageContainer>
	{@render children()}
</PageContainer>
