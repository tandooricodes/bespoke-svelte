<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className, ...restProps } = $props();

	const ctx = /** @type {{ visibleCount: number }} */ (getContext('combobox'));
</script>

{#if ctx.visibleCount === 0}
	<div class={cn('py-6 text-center text-sm text-muted-foreground', className)} {...restProps}>
		{#if children}
			{@render children()}
		{:else}
			No results found.
		{/if}
	</div>
{/if}
