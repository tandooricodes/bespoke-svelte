<script lang="ts">
	import {
		Dialog,
		DialogTrigger,
		DialogContent,
		DialogHeader,
		DialogTitle,
		DialogDescription,
		DialogFooter,
		DialogClose,
		Button,
		Input,
		Label
	} from 'bespoke-components';
	import { Pencil, Trash2 } from 'lucide-svelte';

	let open = $state(false);
	let confirmOpen = $state(false);
	let lastAction = $state('');
</script>

<div class="grid">
	<h1>Dialog</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">A modal dialog that overlays the page content.</p>
	<div class="mb-6">
		<Dialog>
			<DialogTrigger>
				<Button variant="outline">Open Dialog</Button>
			</DialogTrigger>
			<DialogContent>
				<DialogHeader>
					<DialogTitle>Dialog Title</DialogTitle>
					<DialogDescription>
						This is a basic dialog with a title and description. Click outside or press Escape to
						close.
					</DialogDescription>
				</DialogHeader>
				<DialogFooter>
					<DialogClose><Button variant="outline">Cancel</Button></DialogClose>
					<Button>Save</Button>
				</DialogFooter>
			</DialogContent>
		</Dialog>
	</div>

	<!-- With Form -->
	<h2>With Form</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Dialogs can contain forms and interactive content.
	</p>
	<div class="mb-6">
		<Dialog>
			<DialogTrigger>
				<Button>
					<Pencil class="mr-2 size-4" />
					Edit Profile
				</Button>
			</DialogTrigger>
			<DialogContent>
				<DialogHeader>
					<DialogTitle>Edit Profile</DialogTitle>
					<DialogDescription>
						Make changes to your profile here. Click save when you're done.
					</DialogDescription>
				</DialogHeader>
				<div class="grid gap-4 py-2">
					<div class="grid gap-2">
						<Label for="p2-name">Name</Label>
						<Input id="p2-name" value="John Doe" />
					</div>
					<div class="grid gap-2">
						<Label for="p2-email">Email</Label>
						<Input id="p2-email" type="email" value="john@example.com" />
					</div>
				</div>
				<DialogFooter>
					<DialogClose><Button variant="outline">Cancel</Button></DialogClose>
					<Button>Save changes</Button>
				</DialogFooter>
			</DialogContent>
		</Dialog>
	</div>

	<!-- Destructive Confirm -->
	<h2>Destructive Confirm</h2>
	<p class="mb-4 text-sm text-muted-foreground">Confirmation dialogs for dangerous actions.</p>
	<div class="mb-6">
		<Dialog bind:open={confirmOpen}>
			<DialogTrigger>
				<Button variant="destructive">
					<Trash2 class="mr-2 size-4" />
					Delete Account
				</Button>
			</DialogTrigger>
			<DialogContent>
				<DialogHeader>
					<DialogTitle>Delete Account</DialogTitle>
					<DialogDescription>
						Are you absolutely sure? This action cannot be undone. This will permanently delete your
						account and remove your data from our servers.
					</DialogDescription>
				</DialogHeader>
				<DialogFooter>
					<DialogClose><Button variant="outline">Cancel</Button></DialogClose>
					<Button
						variant="destructive"
						onclick={() => {
							lastAction = 'Account deleted';
							confirmOpen = false;
						}}
					>
						Delete Account
					</Button>
				</DialogFooter>
			</DialogContent>
		</Dialog>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Bind <code>open</code> with <code>$state</code> for programmatic control:
		</p>
		<div class="flex flex-wrap items-center gap-4">
			<Button onclick={() => (open = true)}>Open Dialog</Button>
			<div class="text-sm text-muted-foreground">
				{#if lastAction}
					<span class="inline-block h-2 w-2 rounded-full bg-green-500"></span>
					Last action: <code class="rounded bg-background px-1 py-0.5">{lastAction}</code>
				{:else}
					No action yet
				{/if}
			</div>
		</div>
	</div>
</div>

<!-- Programmatic dialog (always mounted) -->
<Dialog bind:open>
	<DialogContent>
		<DialogHeader>
			<DialogTitle>Programmatic Dialog</DialogTitle>
			<DialogDescription>
				This dialog is opened via bound state, not a trigger button.
			</DialogDescription>
		</DialogHeader>
		<DialogFooter>
			<DialogClose
				><Button
					variant="outline"
					onclick={() => {
						lastAction = 'Cancelled';
					}}>Cancel</Button
				></DialogClose
			>
			<Button
				onclick={() => {
					lastAction = 'Saved';
					open = false;
				}}
			>
				Confirm
			</Button>
		</DialogFooter>
	</DialogContent>
</Dialog>
