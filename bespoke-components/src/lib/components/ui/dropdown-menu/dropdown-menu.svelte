<script>
	import { setContext } from 'svelte';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className, ...restProps } = $props();

	let open = $state(false);

	/** @param {MouseEvent} e */
	function handleWindowClick(e) {
		if (!rootEl) return;
		if (!rootEl.contains(/** @type {Node} */ (e.target))) {
			open = false;
		}
	}

	setContext('dropdown', {
		get open() { return open; },
		toggle() { open = !open; },
		close() { open = false; }
	});

	/** @type {HTMLDivElement | undefined} */
	let rootEl = $state();
</script>

<svelte:window onclick={handleWindowClick} />

<div bind:this={rootEl} class="relative {className ?? ''}" {...restProps}>
	{@render children?.()}
</div>
