<script>
	import { setContext } from 'svelte';
	import { cn } from '../../../utils.js';

	/** @type {{
	 *   type?: 'single' | 'multiple',
	 *   value?: string | string[],
	 *   collapsible?: boolean,
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   [key: string]: any
	 * }} */
	let {
		type = 'single',
		value = $bindable(type === 'multiple' ? [] : ''),
		collapsible = true,
		children,
		class: className,
		...restProps
	} = $props();

	/** @param {string} v */
	function isOpen(v) {
		if (type === 'multiple') {
			return /** @type {string[]} */ (value).includes(v);
		}
		return value === v;
	}

	/** @param {string} v */
	function toggle(v) {
		if (type === 'multiple') {
			const arr = /** @type {string[]} */ (value);
			value = arr.includes(v) ? arr.filter((x) => x !== v) : [...arr, v];
		} else {
			value = value === v && collapsible ? '' : v;
		}
	}

	setContext('accordion', {
		get type() {
			return type;
		},
		isOpen,
		toggle
	});
</script>

<div class={cn('w-full p-2', className)} {...restProps}>
	{@render children?.()}
</div>
