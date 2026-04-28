<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';

	/** @type {{
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   [key: string]: any
	 * }} */
	let { children, class: className, ...restProps } = $props();

	const accordion = /** @type {{ isOpen: (v: string) => boolean }} */ (getContext('accordion'));
	const item = /** @type {{ value: string }} */ (getContext('accordion-item'));

	const open = $derived(accordion.isOpen(item.value));
</script>

<div
	class="grid transition-all duration-200 ease-out"
	style="grid-template-rows: {open ? '1fr' : '0fr'};"
>
	<div class="overflow-hidden">
		<div class={cn('p-4 text-sm', className)} {...restProps}>
			{@render children?.()}
		</div>
	</div>
</div>
