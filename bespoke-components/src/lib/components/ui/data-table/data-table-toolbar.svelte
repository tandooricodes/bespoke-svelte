<script>
	import { cn } from '../../../utils.js';
	import { Search, X } from 'lucide-svelte';

	/** @type {{
	 *   search?: string,
	 *   placeholder?: string,
	 *   children?: import('svelte').Snippet,
	 *   class?: string
	 * }} */
	let {
		search = $bindable(''),
		placeholder = 'Search...',
		children,
		class: className
	} = $props();
</script>

<div class={cn('flex items-center gap-2 py-3', className)}>
	<div class="relative w-full max-w-sm">
		<Search
			class="pointer-events-none absolute left-2.5 top-1/2 size-4 -translate-y-1/2 text-muted-foreground"
		/>
		<input
			type="text"
			bind:value={search}
			{placeholder}
			class="w-full rounded-md border border-input bg-background py-1.5 pl-8 pr-8 text-sm placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring"
		/>
		{#if search}
			<button
				onclick={() => (search = '')}
				class="absolute right-2.5 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
				aria-label="Clear search"
			>
				<X class="size-3.5" />
			</button>
		{/if}
	</div>
	{#if children}
		{@render children()}
	{/if}
</div>
